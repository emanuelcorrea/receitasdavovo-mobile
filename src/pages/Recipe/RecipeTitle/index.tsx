import { View, Text, TouchableOpacity } from "react-native";
import styles from './styles';
import FontAwesome from 'react-native-vector-icons/FontAwesome';
import AntDesign from 'react-native-vector-icons/AntDesign';

interface RecipeTitleProps {
  title: string;
}

const RecipeTitle = ({ title }: RecipeTitleProps) => {
  return (
    <View style={styles.titleContainer}>
      <View>
        <Text style={styles.recipeTitle}>{title}</Text>

        <View style={{
          display: 'flex',
          flexDirection: 'row',
          alignItems: 'center'
        }}>
          <Text>Bebidas</Text>
          <AntDesign name="star" color="#ffee00" size={12} style={{ marginLeft: 10 }} />
          <Text style={{ fontSize: 12, marginLeft: 3 }}>4</Text>
        </View>
      </View>

      <TouchableOpacity
        onPress={() => null}
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          borderRadius: 100,
          backgroundColor: '#fff',
        }}
      >
        <FontAwesome name="heart-o" size={30} color="#fc9898" />
      </TouchableOpacity>
    </View>
  );
};

export default RecipeTitle;
