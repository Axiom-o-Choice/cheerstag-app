<template>
    <div class="app">
        <img src="@/assets/images/logo.png" width="90%" style="margin-top: 60px" />
        <img src="@/assets/images/visual_mobile.png" width="60%" style="margin: 10px 0 40px 0" />
        <div class="content">
            Hey ben je ook ge-tagged?<br />
            Ben jij ook wel eens iets vergeten?
            <br /><br />
            Een cadeau krijgen is prachtig - maar de herinnering eraan vervaagt vaak sneller dan je denkt.
            <ul style="text-align: left">
                <li>Vergeten herkomst: Die mooie fles wijn... maar van wie was hij ook alweer?</li>
                <li>
                    Verloren context: Je ziet het cadeau nog, maar weet niet meer bij welke gelegenheid je het kreeg.
                </li>
                <li>Gemiste dankbaarheid: Je wil bedanken bedanken, maar weet niet meer wie jou blij heeft gemaakt</li>
                <li>Vluchtige impact: Zonder verhaal wordt elk cadeau uiteindelijk gewoon een object.</li>
            </ul>
            Zo verdwijnen waardevolle momenten van verbinding.
            <br /><br />
            Met CheersTag maak je van een cadeau een blijvende herinnering.<br />
            Wij koppelen verhalen en emoties aan fysieke cadeaus.
            <br /><br />
            Zo blijft niet alleen het cadeau, maar vooral het verhaal erachter, voor altijd bewaard.
            <br /><br />
            Elk cadeau vertelt een verhaal - met CheersTag vergeet je het nooit. Tag je mee?
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
