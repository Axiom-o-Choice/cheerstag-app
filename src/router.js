import { createRouter, createWebHistory } from "vue-router";

import Home from "./views/Home.vue";
import Tags from "./views/Tags.vue";
import Boxes from "./views/Boxes.vue";

const routes = [
    { path: "/tags/:id", component: Tags },
    { path: "/boxes/:id", component: Boxes },
    { path: "/:pathMatch(.*)*", component: Home }
];

export const router = createRouter({
    history: createWebHistory(),
    routes
});
