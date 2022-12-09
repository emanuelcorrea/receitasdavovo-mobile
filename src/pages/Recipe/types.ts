export interface Recipe {
  id: number;
  title: string;
  images: RecipeImage[],
  ingredients: RecipeIngredient[]
  preparations: RecipePreparation[],
}

export interface RecipeImage {
  position: number;
  src: string
}

export interface RecipePreparation {
  name: string;
  position: number;
}

export interface RecipeIngredient {
  name: string;
  position: number;
}
