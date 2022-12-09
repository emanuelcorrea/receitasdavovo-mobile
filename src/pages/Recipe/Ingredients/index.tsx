import React from "react";
import { View, Text } from "react-native";
import recipeStyles from "../../Recipe/styles";

import FontAwesomeIcons from 'react-native-vector-icons/FontAwesome5';
import { Recipe } from "../types";

interface IngredientsProps {
  ingredients: Recipe['ingredients'];
}

const Ingredients = ({ ingredients }: IngredientsProps) => {
  return (
    <View style={recipeStyles.listContainer}>
      <View style={recipeStyles.titleContainer}>
        <FontAwesomeIcons name="clipboard-list" size={26} color="#fc9898" />
        <Text style={recipeStyles.title}>Ingredientes</Text>
      </View>

      <View style={recipeStyles.listItems}>
        {ingredients.map((ingredient) => {
          return (
            <View style={recipeStyles.item} key={ingredient.position}>
              <Text style={[recipeStyles.itemPrefix, recipeStyles.itemIcon]}>{"\u2022"}</Text>
              <Text style={recipeStyles.itemName}>{ingredient.name}</Text>
            </View>
          );
        })}
      </View>
    </View>
  );
}

export default Ingredients;