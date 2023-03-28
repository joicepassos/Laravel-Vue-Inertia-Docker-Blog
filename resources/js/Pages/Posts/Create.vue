<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link, useForm, usePage } from '@inertiajs/vue3';

const form = useForm({
    title: '',
    body: '',
});

const props = defineProps({
    title: String,
    body: String,
});

const posts = usePage().props.posts;

const submit = () => {
    form.post(route('posts.store'), {
        onFinish: () => form.reset('title', 'body'),
    });
};


</script>

<template>
    <Head title="Criar Post" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Cadastrar Post</h2>
        </template>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                <section>
                            <form @submit.prevent="submit" class="mt-6 space-y-6">
                            <div>
                            <InputLabel for="title" value="Título" />

                            <TextInput id="title" type="text" class="mt-1 block w-full" v-model="form.title" required
                                autofocus autocomplete="title" />

                            <InputError class="mt-2" :message="form.errors.title" />
                        </div>

                        <div>
                            <InputLabel for="body" value="Conteúdo" />

                            <TextInput id="body" type="text" class="mt-1 block w-full" v-model="form.body" required />

                            <InputError class="mt-2" :message="form.errors.body" />
                        </div>

                        <div class="flex items-center gap-4">
                            <PrimaryButton :disabled="form.processing">Salvar</PrimaryButton>

                            <Transition enter-from-class="opacity-0" leave-to-class="opacity-0"
                                class="transition ease-in-out">
                                <p v-if="form.recentlySuccessful" class="text-sm text-gray-600 dark:text-gray-400">Post
                                    criado com sucesso.</p>
                            </Transition>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
