import { configureStore } from '@reduxjs/toolkit'
import drawerSlice from '../features/drawer/drawerSlice';

export const store = configureStore({
  reducer: {
    drawer: drawerSlice
  }
})

export type RootState = ReturnType<typeof store.getState>

export type AppDispatch = typeof store;