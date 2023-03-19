<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        return inertia('posts/Index', compact('posts'));
    }

    public function create()
    {
        return inertia('posts/Create');
    }

    public function store(Request $request)
    {
        $post = new Post();
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->save();
        return redirect()->route('posts.index');
    }

    public function show(Post $post)
    {
        return inertia('posts/Show', compact('post'));
    }

    public function edit(Post $post)
    {
        return inertia('posts/Edit', compact('post'));
    }

    public function update(Request $request, Post $post)
    {
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->save();
        return redirect()->route('posts.index');
    }

    public function destroy(Post $post)
    {
        $post->delete();
        return redirect()->route('posts.index');
    }
}
