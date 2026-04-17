import React from 'react';
import TabMenu from './TabMenu';
import ClothingCategory from './ClothingCategory';
import type { MaxValues, CurrentClothing, Menu } from '../types';
import { Save, X } from 'lucide-react';
import { fetchNui } from '../utils/Nui';

interface SidebarProps {
  activeTab: string;
  setActiveTab: (t: string) => void;
  menus: Menu[];
  maxValues: MaxValues;
  currentClothing: CurrentClothing;
  handleUpdateSkin: (cat: string, type: 'item' | 'texture', val: number) => void;
  outfits: any[];
  roomOutfits: any[];
  closeUI: () => void;
  requestSave: () => void;
}

const Sidebar: React.FC<SidebarProps> = ({
  activeTab,
  setActiveTab,
  menus,
  maxValues,
  currentClothing,
  handleUpdateSkin,
  outfits,
  roomOutfits,
  closeUI,
  requestSave
}) => {
  // Original categorization helper logic (mapped from old HTML)
  const getCategoryItems = (tab: string) => {
    switch (tab) {
      case 'character':
        return ['model', 'face', 'face2', 'facemix', 'eye_color', 'moles', 'ageing'];
      case 'hair':
        return ['hair', 'eyebrows', 'beard', 'lipstick', 'blush', 'makeup'];
      case 'clothing':
        return ['arms', 't-shirt', 'torso2', 'vest', 'decals', 'accessory', 'bag', 'pants', 'shoes'];
      case 'accessoires':
        return ['mask', 'hat', 'glass', 'ear'];
      default:
        return [];
    }
  };

  const handleSaveOutfit = () => requestSave();
  const handleCancel = () => {
    fetchNui('resetOutfit');
    closeUI();
  };

  const selectOutfit = (outfit: any, isMyOutfit: boolean) => {
    fetchNui('selectOutfit', {
      outfitData: isMyOutfit ? outfit.skin : outfit.outfitData,
      outfitName: isMyOutfit ? outfit.outfitname : outfit.outfitLabel,
      outfitId: isMyOutfit ? outfit.outfitId : undefined,
    });
  };

  const deleteOutfit = (outfit: any) => {
    fetchNui('removeOutfit', {
      outfitData: outfit.skin,
      outfitName: outfit.outfitname,
      outfitId: outfit.outfitId,
    });
  };

  return (
    <div className="w-[450px] h-full flex flex-col overflow-hidden animate-slide-in-right gap-4">
      <div className="bg-transparent shrink-0 z-10 sticky top-0">
         <TabMenu menus={menus} activeTab={activeTab} setActiveTab={setActiveTab} />
      </div>
      
      <div className="flex-1 overflow-y-auto space-y-4 pr-2">
        {['character', 'hair', 'clothing', 'accessoires'].includes(activeTab) && 
          getCategoryItems(activeTab).map(cat => (
             <ClothingCategory
                key={cat}
                category={cat}
                maxValue={maxValues[cat]}
                currentValue={currentClothing[cat]}
                updateSkin={handleUpdateSkin}
             />
          ))
        }

        {activeTab === 'roomOutfits' && (
           <div className="space-y-3">
             {roomOutfits.map((o, i) => (
               <div key={i} className="flex justify-between items-center p-3 bg-white/[0.03] border border-white/5 rounded-lg hover:bg-white/10 transition-colors">
                  <span className="font-semibold text-gray-200">{o.outfitLabel}</span>
                  <button onClick={() => selectOutfit(o, false)} className="px-4 py-2 bg-primary hover:bg-primary-hover text-sm rounded-md transition-colors text-white font-medium shadow-sm">Equip</button>
               </div>
             ))}
           </div>
        )}

        {activeTab === 'myOutfits' && (
           <div className="space-y-3">
             {outfits.map((o, i) => (
               <div key={i} className="flex justify-between items-center p-3 bg-white/[0.03] border border-white/5 rounded-lg hover:bg-white/10 transition-colors">
                  <span className="font-semibold text-gray-200">{o.outfitname}</span>
                  <div className="flex gap-2">
                    <button onClick={() => selectOutfit(o, true)} className="px-3 py-1.5 bg-primary hover:bg-primary-hover text-sm rounded-md transition-colors font-medium shadow-sm">Equip</button>
                    <button onClick={() => deleteOutfit(o)} className="px-3 py-1.5 bg-red-500/80 hover:bg-red-500 text-sm rounded-md transition-colors font-medium shadow-sm">Delete</button>
                  </div>
               </div>
             ))}
           </div>
        )}
      </div>

      <div className="bg-transparent p-4 border-t border-white/5 shrink-0 flex gap-4">
         <button onClick={handleSaveOutfit} className="flex-1 py-3 bg-primary hover:bg-primary-hover text-white rounded-lg flex justify-center items-center gap-2 font-semibold transition-all shadow-[0_4px_14px_0_rgba(21,128,61,0.39)]">
           <Save size={18} /> Save Outfit
         </button>
         <button onClick={handleCancel} className="flex-1 py-3 bg-white/5 hover:bg-white/10 border border-white/10 rounded-lg flex justify-center items-center gap-2 font-semibold transition-all text-gray-300 hover:text-white">
           <X size={18} /> Cancel
         </button>
      </div>
    </div>
  );
};

export default Sidebar;
