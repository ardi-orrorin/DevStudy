import { Suspense, lazy } from 'react';
const Post = lazy(() => import('./Post.jsx'));

export default function Home() {
    return (
        <>
            <h1>Home</h1>
            <Suspense fallback={<div>Loading Component...</div>}>
                <Post />
            </Suspense>
        </>
    )
}