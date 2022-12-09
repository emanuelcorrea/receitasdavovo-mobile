import React from "react";
import { View, Image, Text } from "react-native";
import styles from "./styles";

const RecipeHeader = ({ recipe }: any) => {
  return (
    <View style={styles.imageContainer}>
      <Image
        style={styles.image}
        source={{
          uri: recipe.images[0].src
        }}
      />
      
      <View style={[styles.line, styles.lineLeft]}></View>
      <Text style={styles.title}>{recipe.title}</Text>
      <View style={[styles.line, styles.lineRight]}></View>

      <View style={ styles.lineBottom }></View>
    </View>
  );
}

export default RecipeHeader;