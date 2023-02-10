import React from "react";
import { View, Text } from "react-native";
import recipeStyles from "../../Recipe/styles";

import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import Entypo from 'react-native-vector-icons/Entypo';
import { Recipe } from "../types";

interface IngredientsProps {
  ingredients: Recipe['ingredients'];
}

const Ingredients = ({ ingredients }: IngredientsProps) => {
  return (
    <View style={recipeStyles.listContainer}>
      <View style={recipeStyles.titleContainer}>
        <MaterialCommunityIcons
          style={recipeStyles.iconTitle}
          name="silverware-fork-knife"
          size={26}
          color="#fc9898"
        />
        <Text style={recipeStyles.title}>Ingredientes</Text>
      </View>

      <View style={recipeStyles.listItems}>
        {ingredients.map((ingredient) => {
          return (
            <View style={recipeStyles.item} key={ingredient.position}>
              <Entypo
                style={[recipeStyles.itemPrefix, recipeStyles.itemIcon]}
                name="dot-single"
                size={28}
                color="#fc9898"
              />
              <Text style={recipeStyles.itemName}>{ingredient.name}</Text>
            </View>
          );
        })}
      </View>
    </View>
  );
};

export default Ingredients;
