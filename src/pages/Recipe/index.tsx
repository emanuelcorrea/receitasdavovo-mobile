import React from "react";
import { Route, ScrollView, View } from "react-native";
import Ingredients from "./Ingredients";
import PreparationMode from "./PreparationMode";
import RecipeHeader from "./RecipeHeader";
import styles from "./styles";
import { Recipe as RecipeType } from "./types";
import RecipeTitle from "./RecipeTitle";

interface RouteProduct extends Route {
  route: {
    params: {
      recipe: RecipeType
    }
  }
}

type RecipeProps = RouteProduct;

const Recipe = ({ route }: RecipeProps) => {
  const { recipe } = route.params;

  return (
    <ScrollView
      contentContainerStyle={{ flexGrow: 1, backgroundColor: '#fff' }}
      contentInsetAdjustmentBehavior="automatic"
    >
      <RecipeHeader recipe={recipe} />
      
      <View style={styles.content}>
        <RecipeTitle title={recipe.title}  />
        <Ingredients ingredients={recipe.ingredients} />
        <PreparationMode preparations={recipe.preparations} />
      </View>
    </ScrollView>
  );
};

export default Recipe;
