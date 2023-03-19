<template>
    <div>
      <h1>Posts</h1>
      <div class="d-flex justify-content-between mb-3">
        <a href="{{ route('posts.create') }}" class="btn btn-primary">Novo post</a>
        <div>
          <input v-model="search" type="text" class="form-control" placeholder="Pesquisar...">
        </div>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>Título</th>
            <th>Conteúdo</th>
            <th>Data de criação</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="post in filteredPosts" :key="post.id">
            <td>{{ post.title }}</td>
            <td>{{ post.content }}</td>
      <td>{{ formatDate(post.created_at) }}</td>
      <td>
        <a :href="route('posts.edit', post.id)" class="btn btn-secondary">Editar</a>
        <button @click="deletePost(post.id)" class="btn btn-danger">Excluir</button>
      </td>
    </tr>
  </tbody>
</table>
</div>
</template>
<script>
export default {
  data() {
    return {
      posts: @json($posts),
      search: '',
    };
  },
  computed: {
    filteredPosts() {
      return this.posts.filter(post => post.title.toLowerCase().includes(this.search.toLowerCase()));
    },
  },
  methods: {
    formatDate(date) {
      return moment(date).format('DD/MM/YYYY');
    },
    async deletePost(id) {
      if (confirm('Tem certeza que deseja excluir este post?')) {
        await this.$inertia.delete(route('posts.destroy', id));
        this.posts = this.posts.filter(post => post.id !== id);
      }
    },
  },
};
</script>  