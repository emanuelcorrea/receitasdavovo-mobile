import { Image, Text, View } from "react-native";
import styles from "./styles";
import { RecipeCompactProps } from "./types";
import { Shadow } from 'react-native-shadow-2';

import FontAwesomeIcons from 'react-native-vector-icons/FontAwesome'
import * as RouteNavigation from '../RouteNavigation';

const RecipeCompact = ({ recipe }: RecipeCompactProps) => {
  return (
    <View
      style={{ position: 'relative', marginHorizontal: 15, marginTop: 15, marginBottom: 0 }}
      onTouchEnd={() => RouteNavigation.navigate('Recipe', { recipe })}
    >
      <Shadow
        style={styles.recipeContainer}
        distance={5}
      >
        <View>
          <Image
            style={styles.recipeImage}
            source={{
              uri: recipe.images[0].src
            }}
          />
        </View>

        <View style={styles.recipeDescription}>
          <Text style={styles.recipeTitle}>{recipe.title}</Text>

          <View style={styles.recipeRate}>
            <FontAwesomeIcons name="star" size={20} color="#fbf024" /> 
            <FontAwesomeIcons name="star" size={20} color="#fbf024" /> 
            <FontAwesomeIcons name="star" size={20} color="#fbf024" /> 
            <FontAwesomeIcons name="star" size={20} color="#fbf024" /> 
            <FontAwesomeIcons name="star" size={20} color="#fbf024" /> 
          </View>

          <Text style={styles.recipeCategory}>{recipe.category}</Text>
        </View>
      </Shadow>
    </View>
  );
}

export default RecipeCompact;