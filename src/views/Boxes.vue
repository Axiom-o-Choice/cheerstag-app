<template>
    <div class="app">
        <img src="@/assets/images/cheerstag.png" width="250px" />
        <div class="collection">Boxes</div>
        <div class="id">{{ id }}</div>
        <div class="hash">{{ hash }}</div>
    </div>
</template>

<script setup>
import { computed } from "vue";

import { useRoute } from "vue-router";

const route = useRoute();

const id = computed(() => route.params.id);
const hash = computed(() => route.hash.slice(1));
</script>

<style scoped>
.app {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
    font: normal 12px/12px "Montserrat";
}
</style>
