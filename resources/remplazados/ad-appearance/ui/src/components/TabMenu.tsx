import React from 'react';
import type { Menu as MenuType } from '../types';
import { User, Shirt, Glasses, Users, Save } from 'lucide-react';

interface TabMenuProps {
  menus: MenuType[];
  activeTab: string;
  setActiveTab: (t: string) => void;
}

const TabMenu: React.FC<TabMenuProps> = ({ menus, activeTab, setActiveTab }) => {
  const getIcon = (menuId: string) => {
    switch (menuId) {
      case 'character': return <User size={18} />;
      case 'clothing': return <Shirt size={18} />;
      case 'accessoires': return <Glasses size={18} />;
      case 'roomOutfits': return <Users size={18} />;
      case 'myOutfits': return <Save size={18} />;
      default: return <User size={18} />;
    }
  };

  return (
    <div className="flex w-full overflow-x-auto p-2 gap-2 hide-scrollbar">
      {menus.map((menu, idx) => (
        <button
          key={idx}
          onClick={() => setActiveTab(menu.menu)}
          className={`
            flex-1 min-w-[80px] p-3 flex flex-col items-center justify-center gap-1 rounded-lg transition-all duration-300
            ${activeTab === menu.menu 
              ? 'bg-primary text-white shadow-[0_0_15px_rgba(15,118,110,0.5)]' 
              : 'text-gray-400 hover:bg-white/5 hover:text-white'
            }
          `}
        >
          {getIcon(menu.menu)}
          <span className="text-[10px] font-medium uppercase tracking-wider">{menu.label}</span>
        </button>
      ))}
    </div>
  );
};

export default TabMenu;
