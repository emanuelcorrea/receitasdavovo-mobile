import React, { PropsWithChildren } from "react";
import { ScrollView, View, Text, StyleSheet, useColorScheme, SafeAreaView } from "react-native";
import { Colors, DebugInstructions, LearnMoreLinks, ReloadInstructions } from "react-native/Libraries/NewAppScreen";
import RecipeCard from "../../components/RecipeCard";
import styles from "./styles";
import products from '../../products.json';

const Account = () => {
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
      <Text style={{ fontSize: 30}}>Minha Conta</Text>
    </ScrollView>
  )
}

export default Account;