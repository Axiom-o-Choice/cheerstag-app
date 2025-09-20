<template>
    <div class="app">
        <img src="@/assets/images/logo.png" width="90%" style="margin-top: 60px" />
        <img src="@/assets/images/visual_mobile.png" width="60%" style="margin: 10px 0 40px 0" />
        <div class="content">
            Hey ben je ook ge-tagged?
            <br /><br />

            Maak ook van Cadeau naar een blijvende herinnering. Veel te vaak verliezen cadeaus hun emotionele waarde.
            <br /><br />

            <ul style="text-align: left">
                <li>Vergeten herkomst: Die mooie fles wijn, maar van wie was die ook alweer?</li>
                <li>
                    Verloren context: Het cadeau is er nog, maar de reden en het moment van ontvangst zijn verdwenen
                </li>
                <li>Gemiste dankbaarheid: Geen idee wie je moet bedanken voor dat attente gebaar</li>
                <li>Vluchtige impact: Zonder verhaal wordt elk cadeau gewoon een object</li>
            </ul>

            Dus.. Waardevolle momenten van verbinding gaan voor altijd verloren. CheersTag koppelt een herinneringen aan
            jouw fysieke cadeaus elk cadeau vertelt een verhaal - wij zorgen dat het verhaal nooit verloren gaat"
            <br /><br />

            Dit is een prototype, <a href="mailto:info@cheerstag.nl">we horen graag jouw ervaring</a>.
        </div>
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

<style scoped>
.content {
    max-width: 500px;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    line-height: 24px;
    margin: 8px 40px;
    margin-bottom: 100px;
}
</style>
