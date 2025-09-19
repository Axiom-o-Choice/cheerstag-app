<template>
    <div class="app">
        <img src="@/assets/images/logo.png" width="90%" style="margin-top: 60px" />
        <img src="@/assets/images/visual.png" width="80%" />
        <!-- 
        <div class="collection">Tags</div>
        <div class="id">{{ id }}</div>
        <div class="hash">{{ hash }}</div>
        -->

        <template v-if="giver">
            <div class="content">
                Schrijf hier het bericht voor de ontvanger. Na opslag is het bericht beschikbaar voor de ontvanger en is
                het niet meer mogelijk het bericht aan te passen.
            </div>

            <div class="input">
                <textarea placeholder="Plaats hier je bericht..." v-model="text"></textarea>
            </div>

            <div class="action">
                <button @click="save">Opslaan</button>
            </div>
        </template>

        <template v-if="receiver">
            <div class="content">Volgende bericht is voor jou achtergelaten:</div>

            <div class="text">{{ text }}</div>
        </template>

        <div class="disclaimer">
            Deze toepassing bevindt zich in een pilotfase. Ingevoerde teksten en gegevens worden uitsluitend gebruikt
            voor testdoeleinden en niet verder verwerkt en hergebruikt. Wij behouden ons het recht voor om alle
            ingevoerde teksten en gegevens na 30 dagen te verwijderen.
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
const giver = ref(true);
const receiver = ref(false);

watch(
    id,
    async () => {
        const res = await fetch(`/api/tags/${id.value}`);
        const json = await res.json();

        text.value = json?.result?.text;

        if (text.value) {
            giver.value = false;
            receiver.value = true;
        } else {
            giver.value = true;
            receiver.value = false;
        }
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

    giver.value = false;
    receiver.value = true;
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
    max-width: 500px;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    line-height: 24px;
    margin: 8px 40px;
}

.input {
    width: 80%;
    margin: 8px 40px;
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
    max-width: 500px;
    margin: 8px 40px;
}

button {
    background-color: var(--ct-teal);
    color: var(--ct-white);
    width: 200px;
    border-radius: 8px;
    border: none;
    line-height: 32px;
}

.disclaimer {
    font-size: 12px;
    line-height: 18px;
    max-width: 500px;
    text-align: center;
    margin: 8px 40px;
}

.text {
    background-color: var(--ct-teal);
    color: var(--ct-white);
    width: 60%;
    padding: 24px;
    font-size: 18px;
    line-height: 24px;
    white-space: pre-wrap;
    border-radius: 8px;
    margin-bottom: 40px;
}
</style>
