<template>
    <div>
      <h1>Criar post</h1>
      <form @submit.prevent="submitForm">
        <div class="mb-3">
          <label class="form-label">Título</label>
          <input v-model="form.title" type="text" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Conteúdo</label>
          <textarea v-model="form.body" class="form-control" rows="10" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Salvar</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        form: {
          title: '',
          content: '',
        },
      };
    },
    methods: {
      async submitForm() {
        await this.$inertia.post(route('posts.store'), this.form);
      },
    },
  };
  </script>
  