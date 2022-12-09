/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React, { useRef, useState } from 'react';
import {
  SafeAreaView,
  StatusBar,
  useColorScheme,
  Button,
  StyleSheet,
  DrawerLayoutAndroid,
  Text,
  View,
  TouchableOpacity
} from 'react-native';

import { createNavigationContainerRef, NavigationContainer } from '@react-navigation/native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';
import Home from './src/pages/Home';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import FeatherIcons from 'react-native-vector-icons/Feather';
import EvilIcons from 'react-native-vector-icons/EvilIcons';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import Recipe from './src/pages/Recipe';
import { navigationRef } from './src/components/RouteNavigation';

const Stack = createNativeStackNavigator();

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : 'rgb(211, 110, 110)',
  };

  const drawer = useRef<null | any>(null);

  const navigationView = () => (
    <View style={[styles.container, styles.navigationContainer]}>
      <Text style={styles.paragraph}>I'm in the Drawer!</Text>
      <Button
        title="Close drawer"
        onPress={() => drawer.current.closeDrawer()}
      />
    </View>
  );

  return (
    <NavigationContainer ref={navigationRef}>
      <SafeAreaView style={{ ...backgroundStyle, flex: 1 }}>
        <DrawerLayoutAndroid
          ref={drawer}
          drawerWidth={300}
          drawerPosition={'left'}
          renderNavigationView={navigationView}
        >
          <StatusBar
            barStyle={isDarkMode ? 'light-content' : 'dark-content'}
            backgroundColor={backgroundStyle.backgroundColor}
          />

          <Stack.Navigator
            initialRouteName="Home"
            screenOptions={{
            headerTitleAlign: 'center',
            headerTitle: () => (
              <Text style={styles.titleContainer}>Página Inicial</Text>
            ),
            headerLeft: () => (
              <TouchableOpacity onPress={() => drawer.current.openDrawer()}>
                <FeatherIcons name="menu" size={30} color="#fff" />
              </TouchableOpacity>
            ),
            headerRight: () => (
              <View style={styles.menuContainer}>
                <TouchableOpacity>
                  <EvilIcons name="heart" size={30} color="#fff" />
                </TouchableOpacity>

                <TouchableOpacity>
                  <MaterialCommunityIcons name="dots-vertical" size={30} color="#fff" />
                </TouchableOpacity>
              </View>
            ),
            headerStyle: {
              backgroundColor: 'rgb(252, 152, 152)',
            },
            headerTintColor: '#fff'
          }}>
            <Stack.Screen
              name="Home"
              component={Home}
            />
            
            <Stack.Screen
              name="Recipe"
              component={Recipe}
              options={{ headerLeft: undefined, headerTitle: () => (
                <Text style={styles.titleContainer}>Receita</Text>
              ), }}
            />
          </Stack.Navigator>
        </DrawerLayoutAndroid>
      </SafeAreaView>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    padding: 16
  },
  navigationContainer: {
    backgroundColor: "#ecf0f1"
  },
  paragraph: {
    padding: 16,
    fontSize: 15,
    textAlign: "center"
  },
  titleContainer: {
    textAlign: 'center',
    fontSize: 16,
    color: '#fff'
  },
  menuContainer: {
    alignItems: 'center',
    flexDirection: 'row',
    justifyContent: 'flex-end',
  }
});

export default App;
