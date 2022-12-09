import React from "react";
import { Route, ScrollView, View } from "react-native";
import Ingredients from "./Ingredients";
import PreparationMode from "./PreparationMode";
import RecipeHeader from "./RecipeHeader";
import styles from "./styles";
import { Recipe as RecipeType } from "./types";

interface RouteProduct extends Route {
  route: {
    params: {
      recipe: RecipeType
    }
  }
}

interface RecipeProps extends RouteProduct {}

const Recipe = ({ route }: RecipeProps) => {
  const { recipe } = route.params;

  console.log('recipe', recipe)
  
  return (
    <ScrollView
    contentContainerStyle={{ flexGrow: 1 }}
    contentInsetAdjustmentBehavior="automatic"
    >
      <RecipeHeader recipe={recipe} />

      <View style={styles.content}>
        <Ingredients ingredients={recipe.ingredients} />
        <PreparationMode preparations={recipe.preparations} />
      </View>
    </ScrollView>
  )
}

export default Recipe;