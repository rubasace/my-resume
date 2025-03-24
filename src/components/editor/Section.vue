<script setup>

import {Fieldset} from "primevue";
import {ref} from "vue";

defineProps({
  legend: String,
  icon: String
})

const collapsed = ref(false)
</script>

<template>
  <Fieldset :collapsed="collapsed">
    <template #legend>
      <div class="legend" @click="collapsed = !collapsed">
        <i class="icon" :class="icon"></i>
        <span class="title">{{ legend }}</span>
      </div>
    </template>
    <slot/>
  </Fieldset>
</template>

<style scoped lang="sass">
.legend
  display: flex
  align-items: center
  gap: 0.5em
  font-size: 1.3em
  padding: 1em 0
  .icon
    color: var(--p-primary-color)
    &:hover
      cursor: pointer
      color: var(--p-text-color)
  .title
    font-weight: bold


</style>