<script setup>

import TableComponent from '@/Components/Table.vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { ref } from 'vue';

const headers = ['Título', 'Conteúdo'];

const items = [
  { title: 'John Doe', content: 'qwdqdqwdq' },
  { title: 'Jane Smith', content: 'qwdqwdq' },
  { title: 'Bob Johnson', content: 'wqdqdqwd' }
];

</script>

<template>

   <Head title="Posts" />

  <AuthenticatedLayout>
   
    <div class="bg-gray-900 p-8">
                    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Posts cadastrados</h2>

      <TableComponent :headers="headers" :items="items" />
    </div>
  </AuthenticatedLayout>

</template>

<script>
    export default {
      components: {
        AuthenticatedLayout,
        TableComponent
      }
    }
</script>

<style lang="postcss">
  @import 'tailwindcss/base';
  @import 'tailwindcss/components';
  @import 'tailwindcss/utilities';
</style>
