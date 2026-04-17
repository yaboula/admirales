import { useState, useEffect, useRef } from 'react';
import { useNuiEvent, fetchNui } from './utils/Nui';
import Sidebar from './components/Sidebar';
import CameraControls from './components/CameraControls';
import ModalSave from './components/ModalSave';
import type { MaxValues, CurrentClothing, Menu } from './types';

function App() {
  const [isVisible, setIsVisible] = useState(false);
  const [activeTab, setActiveTab] = useState('clothing');
  const [menus, setMenus] = useState<Menu[]>([]);
  const [maxValues, setMaxValues] = useState<MaxValues>({});
  const [currentClothing, setCurrentClothing] = useState<CurrentClothing>({});
  const [outfits, setOutfits] = useState<any[]>([]);
  const [roomOutfits, setRoomOutfits] = useState<any[]>([]);
  const [isSaving, setIsSaving] = useState(false);
  const [canChange, setCanChange] = useState(true);
  const [hasTracker, setHasTracker] = useState(false);

  // Mouse Drag to Rotate 
  const isDragging = useRef(false);
  const lastX = useRef(0);

  const handlePointerDown = (e: React.PointerEvent) => {
    if (e.target === e.currentTarget) {
      isDragging.current = true;
      lastX.current = e.clientX;
      (e.target as HTMLElement).setPointerCapture(e.pointerId);
    }
  };

  const handlePointerMove = (e: React.PointerEvent) => {
    if (!isDragging.current) return;
    const deltaX = e.clientX - lastX.current;
    // Lower threshold for high 'precision y rapidez'
    if (Math.abs(deltaX) > 2) {
      if (deltaX > 0) fetchNui('rotateRight');
      else fetchNui('rotateLeft');
      lastX.current = e.clientX;
    }
  };

  const handlePointerUp = (e: React.PointerEvent) => {
    if (isDragging.current) {
        isDragging.current = false;
        (e.target as HTMLElement).releasePointerCapture(e.pointerId);
    }
  };

  // Keyboard shortcut listener
  useEffect(() => {
    if (!isVisible) return;

    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'a' || e.key === 'A') fetchNui('rotateLeft');
      if (e.key === 'd' || e.key === 'D') fetchNui('rotateRight');
      if (e.key === 'Escape') {
         closeUI();
         fetchNui('resetOutfit'); // Esc cancels by default in standard scripts? The script uses "cancel-menu" button.
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isVisible]);

  // NUI Events
  useNuiEvent('open', (data: any) => {
    setIsVisible(true);
    setHasTracker(data.hasTracker || false);
    if (data.maxValues) setMaxValues(data.maxValues);
    setCurrentClothing(data.currentClothing || {});
    setMenus(data.menus || []);
    
    // Parse outfits
    const m = data.menus?.find((m: any) => m.menu === "myOutfits");
    if (m) setOutfits(m.outfits || []);
    
    const r = data.menus?.find((m: any) => m.menu === "roomOutfits");
    if (r) setRoomOutfits(r.outfits || []);
    
    const selected = data.menus?.find((m: any) => m.selected);
    if (selected) setActiveTab(selected.menu);
  });

  useNuiEvent('close', () => {
    setIsVisible(false);
    setIsSaving(false);
  });

  useNuiEvent('updateMax', (data: any) => {
    if (data.maxValues) setMaxValues(data.maxValues);
  });

  useNuiEvent('reloadMyOutfits', (data: any) => {
    if (data.outfits) setOutfits(data.outfits);
  });

  useNuiEvent('toggleChange', (data: any) => {
    setCanChange(data.allow);
  });

  useNuiEvent('ResetValues', () => {
    // Need to reset to defaultItem & defaultTexture for all CurrentClothing
    setCurrentClothing(prev => {
      const next = { ...prev };
      Object.keys(next).forEach(cat => {
        if (next[cat].defaultItem !== undefined) {
          next[cat].item = next[cat].defaultItem;
          next[cat].texture = next[cat].defaultTexture;
        }
      });
      return next;
    });
  });

  const closeUI = () => {
    fetchNui('close');
    setIsVisible(false);
  };

  const saveOutfit = (name: string) => {
    fetchNui('saveClothing');
    if (name) {
      fetchNui('saveOutfit', { outfitName: name });
    }
    setIsSaving(false);
    closeUI();
  };

  const handleUpdateSkin = (category: string, itemType: 'item' | 'texture', value: number) => {
    if (!canChange) return;

    // Tracker check
    if (hasTracker && category === 'accessory') {
      fetchNui('TrackerError');
      return;
    }

    const max = itemType === 'item' ? maxValues[category]?.item : maxValues[category]?.texture;
    
    // Bounds check
    let newValue = value;
    if (newValue < 0) newValue = max || 0; // Wrap around bottom
    if (newValue > (max || 0)) newValue = 0; // Wrap around top

    // Specific logic for accessories
    if (category === 'accessory') {
       if (newValue === 13) newValue = itemType === 'item' && value > currentClothing[category].item ? 14 : 12;
    }

    setCurrentClothing(prev => ({
      ...prev,
      [category]: {
        ...prev[category],
        [itemType]: newValue,
      }
    }));

    if (category === 'model') {
       fetchNui('setCurrentPed', { ped: newValue });
    } else {
       fetchNui('updateSkin', {
         clothingType: category,
         articleNumber: newValue,
         type: itemType,
       });

       // If changing item, reset texture
       if (itemType === 'item') {
         const defTex = currentClothing[category]?.defaultTexture || 0;
         fetchNui('updateSkin', { clothingType: category, articleNumber: defTex, type: 'texture' });
         setCurrentClothing(prev => ({
           ...prev,
           [category]: { ...prev[category], texture: defTex }
         }));
       }
    }
  };

  if (!isVisible) return null;

  return (
    <div 
       className="w-full h-full overflow-hidden flex flex-col justify-between"
       onPointerDown={handlePointerDown}
       onPointerMove={handlePointerMove}
       onPointerUp={handlePointerUp}
       style={{ cursor: isDragging.current ? 'grabbing' : 'grab' }}
    >
      <CameraControls />
      <div className="flex flex-1 justify-end py-10 mr-10 relative min-h-0">
         <Sidebar 
          activeTab={activeTab} 
          setActiveTab={setActiveTab}
          menus={menus}
          maxValues={maxValues}
          currentClothing={currentClothing}
          handleUpdateSkin={handleUpdateSkin}
          outfits={outfits}
          roomOutfits={roomOutfits}
          closeUI={closeUI}
          requestSave={() => setIsSaving(true)}
         />
      </div>
      {isSaving && (
        <ModalSave 
          onSave={saveOutfit} 
          onCancel={() => setIsSaving(false)} 
        />
      )}
    </div>
  );
}

export default App;
