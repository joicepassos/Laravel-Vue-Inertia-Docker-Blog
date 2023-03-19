<?php

use App\Models\Post;
use Illuminate\Foundation\Testing\RefreshDatabase;


uses(RefreshDatabase::class);

test('test creating a post', function () {
    $post = Post::factory()->create();
    $this->assertInstanceOf(Post::class, $post);
});

