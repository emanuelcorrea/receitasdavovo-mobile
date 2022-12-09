import { createSlice } from "@reduxjs/toolkit";
import type { PayloadAction } from "@reduxjs/toolkit";

export interface DrawerSlice {
  isOpen: boolean;
}

const initialState: DrawerSlice = {
  isOpen: false
};

export const drawerSlice = createSlice({
  name: 'images',
  initialState,
  reducers: {
    changeDrawer: (state: DrawerSlice, { payload }) => {
      state.isOpen = payload;
    },
  }
})

export default drawerSlice.reducer;

export const { changeDrawer } = drawerSlice.actions;