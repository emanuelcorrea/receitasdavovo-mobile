import React, { useRef } from 'react';
import {
  SafeAreaView,
  StatusBar,
  useColorScheme,
  Button,
  DrawerLayoutAndroid,
  Text,
  View,
  TouchableOpacity
} from 'react-native';

import { NavigationContainer } from '@react-navigation/native';

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

import styles from './App.styles';
import Drawer from './src/components/Drawer';
import Account from './src/pages/Account';
import Recipes from './src/pages/Recipes';
import Support from './src/pages/Support';

const Stack = createNativeStackNavigator();

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : 'rgb(211, 110, 110)',
  };

  const drawer = useRef<null | any>(null);

  const navigationView = () => (
    <Drawer drawer={drawer} />
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

            <Stack.Screen
              name="Account"
              component={Account}
              options={{ headerLeft: undefined, headerTitle: () => (
                <Text style={styles.titleContainer}>Minha Conta</Text>
              ), }}
            />

            <Stack.Screen
              name="Recipes"
              component={Recipes}
              options={{ headerLeft: undefined, headerTitle: () => (
                <Text style={styles.titleContainer}>Minhas Receitas</Text>
              ), }}
            />

            <Stack.Screen
              name="Support"
              component={Support}
              options={{ headerLeft: undefined, headerTitle: () => (
                <Text style={styles.titleContainer}>Suporte</Text>
              ), }}
            />
          </Stack.Navigator>
        </DrawerLayoutAndroid>
      </SafeAreaView>
    </NavigationContainer>
  );
};

export default App;
