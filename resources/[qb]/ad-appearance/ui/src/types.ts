export interface ClothingOption {
  item: number;
  texture: number;
  defaultItem?: number;
  defaultTexture?: number;
}

export interface MaxValues {
  [key: string]: {
    type: string;
    item: number;
    texture: number;
  };
}

export interface CurrentClothing {
  [key: string]: ClothingOption | any; // Any added for `facemix`
}

export interface Menu {
  menu: string;
  label: string;
  selected: boolean;
  outfits?: any[];
}
