import React from 'react';
import { ChevronLeft, ChevronRight } from 'lucide-react';
import type { ClothingOption } from '../types';

interface ClothingCategoryProps {
  category: string;
  maxValue?: { item: number; texture: number };
  currentValue?: ClothingOption | any;
  updateSkin: (cat: string, type: 'item' | 'texture', val: number) => void;
}

const formatName = (name: string) => {
  return name.replace('_', ' ').replace(/\b\w/g, l => l.toUpperCase());
};

const ClothingCategory: React.FC<ClothingCategoryProps> = ({
  category,
  maxValue,
  currentValue,
  updateSkin
}) => {
  if (!currentValue) return null;
  const safeMaxValue = maxValue || { item: 100, texture: 100 }; // Fail-safe default

  // Render "Facemix" special case (range sliders)
  if (category === 'facemix') {
     return (
       <div className="bg-black/95 border border-white/10 rounded-xl p-4 space-y-4">
         <h3 className="font-bold text-sm tracking-widest text-primary mb-2 uppercase">{formatName(category)}</h3>
         
         {/* Shape Mix */}
         <div className="space-y-3">
            <h4 className="text-[10px] font-semibold text-gray-400 uppercase tracking-wider text-center">Shape Mix</h4>
            <div className="flex items-center gap-3">
              <span className="text-xs font-medium text-gray-400 w-14 text-right">MOTHER</span>
              <input 
                type="range" 
                className="flex-1 h-1.5 bg-black/40 rounded-lg appearance-none cursor-pointer accent-primary" 
                min="0" max="0.99" step="0.01"
                value={currentValue.shapeMix || 0.5}
                onChange={(e) => updateSkin('facemix', 'shapeMix' as any, parseFloat(e.target.value))}
              />
              <span className="text-xs font-medium text-gray-400 w-14 text-left">FATHER</span>
            </div>
         </div>

         {/* Skin Mix */}
         <div className="space-y-3">
            <h4 className="text-[10px] font-semibold text-gray-400 uppercase tracking-wider text-center">Skin Mix</h4>
            <div className="flex items-center gap-3">
              <span className="text-xs font-medium text-gray-400 w-14 text-right">MOTHER</span>
              <input 
                type="range" 
                className="flex-1 h-1.5 bg-black/40 rounded-lg appearance-none cursor-pointer accent-primary" 
                min="0" max="0.99" step="0.01"
                value={currentValue.skinMix || 0.5}
                onChange={(e) => updateSkin('facemix', 'skinMix' as any, parseFloat(e.target.value))}
              />
              <span className="text-xs font-medium text-gray-400 w-14 text-left">FATHER</span>
            </div>
         </div>
       </div>
     );
  }

  // Regular Item/Texture categorizer
  const currentItem = currentValue.item ?? 0;
  const currentTexture = currentValue.texture ?? 0;
  
  return (
    <div className="bg-black/95 border border-white/10 rounded-xl p-3 flex flex-col gap-3">
      <h3 className="font-bold text-sm tracking-widest text-primary mb-1 uppercase">{formatName(category)}</h3>
      
      {/* Model Carousel */}
      <CarouselRow 
        title="Model"
        current={currentItem}
        max={safeMaxValue.item}
        onPrev={() => updateSkin(category, 'item', currentItem - 1)}
        onNext={() => updateSkin(category, 'item', currentItem + 1)}
        onSet={(val) => updateSkin(category, 'item', val)}
      />

      {/* Texture Carousel */}
      {safeMaxValue.texture > 0 && (
         <div className="pt-2 border-t border-white/5">
            <CarouselRow 
               title="Texture"
               current={currentTexture}
               max={safeMaxValue.texture}
               onPrev={() => updateSkin(category, 'texture', currentTexture - 1)}
               onNext={() => updateSkin(category, 'texture', currentTexture + 1)}
               onSet={(val) => updateSkin(category, 'texture', val)}
            />
         </div>
      )}
    </div>
  );
};

// Sub-component for clean layout
const CarouselRow = ({ title, current, max, onPrev, onNext, onSet }: {
  title: string, current: number, max: number, onPrev: () => void, onNext: () => void, onSet: (val: number) => void
}) => {
  return (
    <div className="flex items-center justify-between group">
      <span className="text-xs font-semibold text-gray-400 w-16 group-hover:text-gray-300 transition-colors">{title}</span>
      <div className="flex items-center gap-2">
        <button onClick={onPrev} className="p-1 rounded-md bg-black/20 hover:bg-white/10 hover:text-primary transition-colors text-gray-400">
           <ChevronLeft size={16} />
        </button>
        <div className="w-20 text-center font-mono text-sm bg-black/40 rounded-md border border-white/5 flex items-center justify-center shadow-inner overflow-hidden focus-within:border-primary/50 transition-colors">
           <input 
             type="number" 
             value={current === -1 ? '' : current}
             placeholder="Off"
             onChange={(e) => {
                let val = parseInt(e.target.value);
                if (isNaN(val)) val = -1;
                onSet(val);
             }}
             className="w-10 bg-transparent text-center focus:outline-none placeholder:text-gray-600 appearance-none [-moz-appearance:_textfield] [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none min-w-0"
           />
           <span className="text-gray-500 text-[10px] select-none pr-2">/ {max}</span>
        </div>
        <button onClick={onNext} className="p-1 rounded-md bg-black/20 hover:bg-white/10 hover:text-primary transition-colors text-gray-400">
           <ChevronRight size={16} />
        </button>
      </div>
    </div>
  );
};

export default ClothingCategory;
