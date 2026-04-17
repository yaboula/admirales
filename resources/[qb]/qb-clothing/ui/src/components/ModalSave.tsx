import React, { useState } from 'react';
import { Save } from 'lucide-react';

interface ModalSaveProps {
  onSave: (name: string) => void;
  onCancel: () => void;
}

const ModalSave: React.FC<ModalSaveProps> = ({ onSave, onCancel }) => {
  const [name, setName] = useState('');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(name.trim());
  };

  return (
    <div className="absolute inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm animate-fade-in">
      <div className="bg-surface border border-white/10 rounded-xl p-6 w-full max-w-md shadow-2xl flex flex-col gap-6 animate-slide-up">
        
        <div className="flex items-center gap-3 text-primary">
          <Save size={24} />
          <h2 className="text-xl font-bold uppercase tracking-wider text-white">Save Outfit</h2>
        </div>
        
        <p className="text-sm text-gray-400">
          Do you want to save this look as an outfit in your wardrobe? Enter a name below, or leave it blank to just save your character.
        </p>

        <form onSubmit={handleSubmit} className="flex flex-col gap-4">
          <input 
            type="text" 
            autoFocus
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Outfit Name (Optional)"
            className="w-full bg-black/40 border border-white/10 rounded-lg p-3 text-white placeholder:text-gray-600 focus:outline-none focus:border-primary transition-colors"
          />

          <div className="flex gap-4 mt-2">
            <button 
              type="button" 
              onClick={onCancel}
              className="flex-1 py-3 bg-white/5 hover:bg-white/10 rounded-lg font-semibold transition-colors"
            >
              Cancel
            </button>
            <button 
              type="submit" 
              className={`flex-1 py-3 rounded-lg font-semibold transition-colors bg-primary hover:bg-primary-hover text-white shadow-md`}
            >
              Confirm
            </button>
          </div>
        </form>
        
      </div>
    </div>
  );
};

export default ModalSave;
