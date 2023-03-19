<template>
    <div>
      <h1>Editar post</h1>
      <form @submit.prevent="submitForm">
        <div class="mb-3">
          <label class="form-label">Título</label>
          <input v-model="form.title" type="text" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Conteúdo</label>
          <textarea v-model="form.content" class="form-control" rows="10" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Salvar</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      post: {
        type: Object,
        required: true,
      },
    },
    data() {
      return {
        form: {
          title: this.post.title,
          content: this.post.content,
        },
      };
    },
    methods: {
      async submitForm() {
        await this.$inertia.put(route('posts.update', this.post.id), this.form);
      },
    },
  };
  </script>
  