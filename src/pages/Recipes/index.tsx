import React from "react";
import { ScrollView, Text } from "react-native";
import RecipeCompact from "../../components/RecipeCompact";
import recipes from '../../products.json';
import { Recipe } from "../Recipe/types";

const Recipes = () => {
  return (
    <ScrollView
    contentContainerStyle={{ flexGrow: 1 }}
    contentInsetAdjustmentBehavior="automatic"
    >
      {recipes.map((recipe) => {
        return (
          <RecipeCompact key={recipe.id} recipe={recipe as Recipe} /> 
        );
      })}
    </ScrollView>
  )
}

export default Recipes;