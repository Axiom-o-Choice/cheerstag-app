<template>
    <div class="app">
        <img src="@/assets/images/logo.png" width="400px" style="margin-top: 60px" />
        <img src="@/assets/images/visual.png" width="250px" />
        <!-- 
        <div class="collection">Tags</div>
        <div class="id">{{ id }}</div>
        <div class="hash">{{ hash }}</div>
        -->
        <div class="content">
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed, reprehenderit voluptate illo in soluta nisi
            ea odit dignissimos dolor doloremque architecto animi autem, laborum, blanditiis fugiat! Labore explicabo
            nisi perspiciatis?
        </div>

        <div class="input">
            <textarea placeholder="Plaats hier je bericht..." v-model="text"></textarea>
        </div>

        <div class="action">
            <button @click="save">Opslaan</button>
        </div>

        <div class="disclaimer">
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Natus adipisci alias ratione, nulla, suscipit,
            perferendis distinctio impedit ipsa exercitationem rem laudantium facere molestias magnam tenetur possimus
            reprehenderit! Libero, sunt laborum.
        </div>
    </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";

import { useRoute } from "vue-router";

import api from "@/utilities/api.js";

const route = useRoute();

const id = computed(() => route.params.id);
const hash = computed(() => route.hash.slice(1));
const text = ref(null);

watch(
    id,
    async () => {
        const res = await fetch(`/api/tags/${id.value}`);
        const json = await res.json();

        text.value = json?.result?.text;
    },
    { immediate: true }
);

const save = async () => {
    await fetch(`/api/tags/${id.value}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ text: text.value })
    });
};
</script>

<style scoped>
.app {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
    font: normal 12px/12px "Montserrat";
}

.content {
    width: 500px;
    text-align: center;
    padding: 16px;
    font-size: 16px;
    line-height: 24px;
}

.input {
    width: 500px;
}

textarea {
    width: 100%;
    height: 100px;
    border: 1px solid var(--ct-teal);
    resize: none;
    border-radius: 8px;
    padding: 8px 16px;
    outline: none;
    font-size: 16px;
    line-height: 24px;
}

.action {
    width: 500px;
}

button {
    background-color: var(--ct-teal);
    color: var(--ct-white);
    width: 100%;
    border-radius: 8px;
    border: none;
    line-height: 32px;
}

.disclaimer {
    font-size: 14px;
    line-height: 18px;
    width: 500px;
    text-align: center;
}
</style>
