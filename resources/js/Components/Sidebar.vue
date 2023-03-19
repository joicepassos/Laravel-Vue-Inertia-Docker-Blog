<template>
    <div class="sidebar bg-gray-800 text-gray-100 h-screen w-16 fixed left-0 top-0">
        <div class="sidebar__logo flex items-center justify-center">
            <font-awesome-icon icon="fa-blog" size="2x" />
        </div>
        <nav class="sidebar__menu mt-10">
            <a href="#"
                class="block py-2.5 px-4 rounded transition duration-200 hover:bg-gray-700 hover:text-gray-100 tooltip"
                data-tooltip="Home">
                <font-awesome-icon icon="fa-home" />
            </a>
            <a href="#"
                class="block py-2.5 px-4 rounded transition duration-200 hover:bg-gray-700 hover:text-gray-100 tooltip"
                data-tooltip="Posts" @click="toggleSubmenu">
                <font-awesome-icon icon="fa-folder" />
            </a>
            <div v-show="showSubmenu" class="sidebar__submenu">
                <a href="#">Criar Post</a>
                <a href="#">Listar Posts</a>
            </div>
            <a href="#"
                class="block py-2.5 px-4 rounded transition duration-200 hover:bg-gray-700 hover:text-gray-100 tooltip"
                data-tooltip="Settings">
                <font-awesome-icon icon="fa-cog" />
            </a>
        </nav>

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
    name: "Sidebar",
    directives: {
        tooltip: Tooltip,
    },
    components: {
        FontAwesomeIcon
    },
    data() {
        return {
            showSubmenu: false,
        }
    },
    methods: {
        toggleSubmenu() {
            this.showSubmenu = !this.showSubmenu;
        },
    },
};
</script>
  
<style scoped>
.sidebar {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    z-index: 1000;
}

.sidebar__logo {
    margin-top: 1rem;
}

.sidebar__menu {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.sidebar__menu a {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 3rem;
    width: 3rem;
    margin-bottom: 0.5rem;
}

.sidebar__menu a .svg-inline--fa {
    font-size: 1.5rem;
}

.sidebar__submenu {
    position: absolute;
    top: 0;
    left: 100%;
    z-index: 1;
    display: none;
    flex-direction: column;
    align-items: center;
    padding: 0.5rem;
    background-color: #2d3748;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    /* Adicionado a classe 'hidden' */
    display: none;
}
  
.sidebar__submenu.hidden {
    display: none;
}


.sidebar__menu a:hover .sidebar__submenu {
    display: flex;
    flex-direction: column;
    position: absolute;
    top: 0;
    left: 100%;
    background-color: #2d3748;
    padding: 0.5rem;
    border-radius: 0.25rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.sidebar__submenu a {
    color: #e2e8f0;
    padding: 0.5rem 1rem;
    transition: background-color 0.2s ease;
}

.sidebar__submenu a:hover {
    background-color: #4a5568;
}</style>