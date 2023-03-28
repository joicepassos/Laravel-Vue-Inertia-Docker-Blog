<script setup>
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

</script>
<template>
    <table class="min-w-full">
        <thead>
            <tr>
                <th v-for="(column, index) in headers" :key="index"
                    class="px-6 py-3 text-left font-bold uppercase tracking-wider">{{ column }}</th>
                <th class="px-6 py-3 text-left font-bold uppercase tracking-wider">Ações</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, index) in items" :key="index" class="bg-white border-b border-gray-200">
                <td v-for="(value, key) in item" :key="key" class="px-6 py-4 whitespace-no-wrap">{{ value }}</td>
                <td class="px-6 py-4 whitespace-no-wrap">
                    <button @click="editItem(index)"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Editar
                    </button>
                    <button @click="deleteItem(index)"
                        class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                        Excluir
                    </button>
                </td>
            </tr>
        </tbody>
</table></template>

<script>
export default {
    props: {
        headers: {
            type: Array,
            required: true
        },
        items: {
            type: Array,
            required: true
        }
    }
};
</script>

<style>
table {
    background-color: #1f2937;
    border-radius: 0.5rem;
    overflow: hidden;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05), 0 1px 3px 1px rgba(0, 0, 0, 0.1);
}

th {
    padding: 0.75rem 1.5rem;
    text-align: left;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: #d1d5db;
}

td {
    padding: 1rem 1.5rem;
    white-space: nowrap;
    color: #9ca3af;
}

tr {
    transition: background-color 0.2s ease;
}

tr:hover {
    background-color: #4b5563;
}

tr:nth-child(even) {
    background-color: #4b5563;
}
</style>
