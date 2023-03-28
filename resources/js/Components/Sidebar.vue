<template>
    <div class="sidebar bg-gray-800 text-gray-100 fixed left-0 top-0">
      <div class="sidebar__logo flex items-center justify-center">
        <font-awesome-icon icon="fa-blog" size="2x" />
      </div>
      <nav class="sidebar__menu mt-10">
        <a href="#" class="sidebar__link" @click="toggleLink('home')">
          <font-awesome-icon icon="fa-home" />
          <span v-show="!isLinkOpen('home')">Home</span>
        </a>
        <a href="#" class="sidebar__link" @click="toggleLink('posts')">
          <font-awesome-icon icon="fa-folder" />
          <span v-show="!isLinkOpen('posts')">Posts</span>
          <span v-show="isLinkOpen('posts')" class="sidebar__submenu">
            <a href="#">Criar Post</a>
            <a href="#">Listar Posts</a>
          </span>
        </a>
        <a href="#" class="sidebar__link" @click="toggleLink('settings')">
          <font-awesome-icon icon="fa-cog" />
          <span v-show="!isLinkOpen('settings')">Settings</span>
        </a>
      </nav>
      <div class="sidebar__overlay" v-show="isLinkOpen()"></div>
    </div>
  </template>


<script>
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faBlog, faHome, faFolder, faCog } from '@fortawesome/free-solid-svg-icons';
import { Tooltip } from "vue-directive-tooltip";
import "vue-directive-tooltip/dist/vueDirectiveTooltip.css";

library.add(faBlog, faHome, faFolder, faCog);

export default {
  data() {
    return {
      links: {
        home: false,
        posts: false,
        settings: false
      }
    };
  },
  methods: {
    toggleLink(link) {
      this.links[link] = !this.links[link];
    },
    isLinkOpen(link = null) {
      if (link) {
        return this.links[link];
      }
      return Object.values(this.links).some(link => link === true);
    }
  }
};
</script>

<style scoped>
 /* Estilos da barra lateral */
 .sidebar {
    height: 100%;
    width: 70px;
    transition: all 0.3s ease-in-out;
    z-index: 100;
  }
  .sidebar__logo {
    height: 70px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #4a5568;
  }
  .sidebar__menu {
    padding: 20px 0;
  }
  .sidebar__link {
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 50px;
    color: #a0aec0;
    text-decoration: none;
    transition: all 0.2s ease-in-out;
  }
  .sidebar__link:hover,
  .sidebar__link:focus {
    color: #fff;
  }
  .sidebar__link span {
    display: none;
    font-size: 0.75rem;
    font-weight: bold;
    margin-top: 5px;
  }
  .sidebar__link svg {
    width: 20px;
    height: 20px;
  }
  .sidebar__submenu {
    position: absolute;
    top: 100%;
    left: 70px;
    display: none;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    background-color: #4a5568;
    width: 150px;
    padding: 10px;
    z-index: 10;
  }
  .sidebar__submenu a {
    display: block;
    color: #a0aec0;
    text-decoration: none;
    transition: all 0.2s ease-in-out;
    font-size: 0.75rem;
    margin-top: 5px;
    font-weight: bold;
  }
  .sidebar__submenu a:hover,
  .sidebar__submenu a:focus {
    color: #fff;
  }
  .sidebar__overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.3);
    z-index: 50;
    display: none;
  }

  @media (max-width: 768px) {
.sidebar {
width: 70%;
height: 100%;
z-index: 1000;
overflow: hidden;
background-color: #111;
position: fixed;
top: 0;
left: -100%;
transition: all 0.3s ease-in-out;
}

.sidebar.active {
left: 0;
}

.sidebar__logo {
padding: 1.5rem 1rem;
justify-content: start;
}

.sidebar__menu {
display: flex;
flex-direction: column;
justify-content: start;
align-items: start;
height: 100%;
padding: 2rem;
}

.sidebar__link {
display: flex;
align-items: center;
text-decoration: none;
color: #fff;
padding: 0.5rem 1rem;
width: 100%;
transition: all 0.3s ease-in-out;
}

.sidebar__link:hover {
background-color: #ff7979;
}

.sidebar__link span {
margin-left: 1rem;
transition: all 0.3s ease-in-out;
display: none;
}

.sidebar__link.active span {
display: block;
}

.sidebar__submenu {
display: none;
flex-direction: column;
padding-left: 2rem;
margin-top: 0.5rem;
}

.sidebar__submenu a {
color: #fff;
padding: 0.5rem 1rem;
text-decoration: none;
transition: all 0.3s ease-in-out;
}

.sidebar__submenu a:hover {
background-color: #ff7979;
}

.sidebar__overlay {
position: fixed;
width: 100%;
height: 100%;
top: 0;
left: 0;
background-color: rgba(0, 0, 0, 0.7);
z-index: 999;
display: none;
}

.sidebar.active ~ .sidebar__overlay {
display: block;
}
}

</style>
