import React from "react";
import { ScrollView, View, Text, StyleSheet, useColorScheme } from "react-native";
import { Colors } from "react-native/Libraries/NewAppScreen";

const Support = () => {
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
      <Text style={{ fontSize: 30 }}>Suporte</Text>
    </ScrollView>
  )
}

export default Support;