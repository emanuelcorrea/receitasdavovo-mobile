import React, { PropsWithChildren } from "react";
import { ScrollView, View, Text, StyleSheet, useColorScheme, SafeAreaView } from "react-native";
import { Colors, DebugInstructions, LearnMoreLinks, ReloadInstructions } from "react-native/Libraries/NewAppScreen";
import RecipeCard from "../../components/RecipeCard";
import styles from "./styles";
import products from '../../products.json';

const Home = () => {
  const isDarkMode = useColorScheme() === 'dark';
  
  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };
  
  return (
    <ScrollView
    contentContainerStyle={{ flexGrow: 1 }}
    contentInsetAdjustmentBehavior="automatic"
    style={{ ...backgroundStyle }}
    >
      <View style={styles.container}>
        {products.map((product) => {
          return (
            <RecipeCard key={product.id} {...product} />
          )
        })}
    </View>
    </ScrollView>
  )
}

export default Home;