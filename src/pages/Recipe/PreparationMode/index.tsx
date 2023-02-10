import React from "react";
import { View, Text } from "react-native";
import recipeStyles from "../../Recipe/styles";
import styles from './styles';

import FontAwesomeIcons from 'react-native-vector-icons/FontAwesome5';
import { Recipe } from "../types";

interface PreparationModeProps {
  preparations: Recipe['preparations']
}

const PreparationMode = ({ preparations }: PreparationModeProps) => {
  return (
    <View style={recipeStyles.listContainer}>
      <View style={recipeStyles.titleContainer}>
        <FontAwesomeIcons
          name="clipboard-list"
          size={26}
          color="#fc9898"
          style={recipeStyles.iconTitle} />
        <Text style={recipeStyles.title}>Modo de Preparo</Text>
      </View>

      <View style={recipeStyles.listItems}>
        {preparations.map((preparation) => {
          return (
            <View style={recipeStyles.item} key={preparation.position}>
              <Text style={[recipeStyles.itemPrefix, recipeStyles.itemOrdered]}>{`${preparation.position}.`}</Text>
              <Text style={styles.itemName}>{preparation.name}</Text>
            </View>
          );
        })}
      </View>
    </View>
  );
};

export default PreparationMode;
