import React, { useState } from 'react';
import { Focus, Navigation } from 'lucide-react';
import { fetchNui } from '../utils/Nui';

const CameraControls: React.FC = () => {
  const [activeCam, setActiveCam] = useState<number | null>(null);

  const handleCamClick = (camValue: number) => {
    if (activeCam === camValue) {
      setActiveCam(null);
      fetchNui('setupCam', { value: 0 }); // Back to full body usually
    } else {
      setActiveCam(camValue);
      fetchNui('setupCam', { value: camValue });
    }
  };

  const cams = [
    { value: 1, label: 'Head' },
    { value: 2, label: 'Torso' },
    { value: 3, label: 'Legs' },
    { value: 0, label: 'Body' },
  ];

  return (
    <div className="absolute top-10 left-1/2 -translate-x-1/2 flex gap-4 bg-black/90 p-3 rounded-full border border-white/10 z-50">
       <div className="flex items-center justify-center pr-3 border-r border-white/10 text-gray-400">
         <Focus size={20} className="mr-2" />
         <span className="text-sm font-semibold uppercase tracking-wider text-white">Camera</span>
       </div>
       
       <div className="flex gap-2">
         {cams.map((cam) => (
           <button
             key={cam.value}
             onClick={() => handleCamClick(cam.value)}
             className={`
               px-4 py-1.5 rounded-full text-sm font-medium transition-all duration-300
               ${activeCam === cam.value
                  ? 'bg-primary text-white shadow-[0_0_15px_rgba(15,118,110,0.4)]'
                  : 'bg-white/5 text-gray-400 hover:bg-white/10 hover:text-white'
               }
             `}
           >
             {cam.label}
           </button>
         ))}
       </div>

       <div className="flex items-center justify-center pl-3 border-l border-white/10 text-gray-400 gap-3">
         <button onClick={() => fetchNui('rotateLeft')} className="p-2 bg-white/5 rounded-full hover:bg-white/20 hover:text-white transition-colors" title="Rotate Left (A)">
            <Navigation size={16} className="-rotate-90" />
         </button>
         <button onClick={() => fetchNui('rotateRight')} className="p-2 bg-white/5 rounded-full hover:bg-white/20 hover:text-white transition-colors" title="Rotate Right (D)">
            <Navigation size={16} className="rotate-90" />
         </button>
       </div>
    </div>
  );
};

export default CameraControls;
