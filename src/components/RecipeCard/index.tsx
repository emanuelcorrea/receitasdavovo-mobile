import { Image, Text, View } from "react-native";
import styles from "./styles";
import * as RootNavigation from '../RouteNavigation/index';

const RecipeCard = (recipe: any) => {
  
  return (
    <View
      style={styles.container}
      onTouchEnd={() => RootNavigation.navigate('Recipe', { recipe })}
    >
      <View style={styles.imageContainer}>
        <Image
          style={styles.image}
          source={{
            uri: recipe.images[0].src
          }}
        />
        <View style={styles.titleContainer}>
          <Text style={styles.title}>{recipe.title}</Text>
        </View>
      </View>
    </View>
  );
}

export default RecipeCard; 