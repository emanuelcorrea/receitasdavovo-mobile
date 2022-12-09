import React from "react";
import { Button, Image, Text, TouchableOpacity, View } from "react-native";
import styles from "./styles";
import { DrawerProps } from "./types";
import FeatherIcons from 'react-native-vector-icons/Feather';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import FontAwesomeIcons from 'react-native-vector-icons/FontAwesome5';
import * as RootNavigation from '../RouteNavigation/index';

const Drawer = ({ drawer }: DrawerProps) => {
  const user = {
    name: 'Emanuel Correa',
    image: 'https://raw.githubusercontent.com/emanuelcorrea/receitasdavovo-mobile/master/assets/images/vovo-feliz.png'
  }

  const menuList = [
    {
      name: 'Minha Conta',
      icon: () => <MaterialCommunityIcons name="account" size={30} color="#fff" />,
      route: 'Account'
    },
    {
      name: 'Minhas Receitas',
      icon: () => <FontAwesomeIcons name="book" size={30} color="#fff" />,
      route: 'Recipes'
    },
    {
      name: 'Suporte',
      icon: () => <MaterialCommunityIcons name="email-newsletter" size={30} color="#fff" />,
      route: 'Support'
    },
    {
      name: 'Sair',
      icon: () => <FeatherIcons name="log-out" size={30} color="#fff" />,
    },
  ];
  
  return (
    <View style={[styles.container]}>
      <View style={styles.header}>
        <Image
          style={styles.imageProfile}
          source={{
            uri: user.image
          }}
        />

        <Text style={styles.userName}>Olá, <Text style={{ color: '#ac5454'}}>{user.name}</Text>!</Text>
      </View>

      <View style={styles.content}>
        <View style={styles.menuList}>
          {menuList.map((menu) => {
            return (
              <TouchableOpacity
                key={menu.route}
                style={styles.menuItem}
                onPress={() => {
                  if (menu.route) RootNavigation.navigate(menu.route)
                  
                  drawer.current.closeDrawer();
                }}
              >
                <Text style={styles.itemName}>{menu.name}</Text>
                {<menu.icon />}
              </TouchableOpacity>
            );
          })}
        </View>
      </View>
    </View>
  );
}

export default Drawer;