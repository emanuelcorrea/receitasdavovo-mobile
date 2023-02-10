import React from "react";
import { View, Image, TouchableOpacity } from "react-native";
import styles from "./styles";
import Ionicons from 'react-native-vector-icons/Ionicons';
import { useNavigation } from "@react-navigation/native";

const RecipeHeader = ({ recipe }: any) => {
  const { goBack } = useNavigation();
  
  return (
    <View style={styles.imageContainer}>
      <TouchableOpacity
        onPress={() => goBack()}
        style={styles.backButton}
      >
        <Ionicons name="ios-arrow-back-sharp" size={26} color="#fc9898" />
      </TouchableOpacity>
      <Image
        style={styles.image}
        source={{
          uri: recipe.images[0].src
        }}
      />
      {/*       
      <View style={[styles.line, styles.lineLeft]}></View>
      <View style={[styles.line, styles.lineRight]}></View>

      <View style={ styles.lineBottom }></View> */}
    </View>
  );
};

export default RecipeHeader;
