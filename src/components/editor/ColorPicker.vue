<script setup>
import {computed, useId} from "vue";

const props = defineProps({
  modelValue: String,
  label: String
})

let id = useId();

const emit = defineEmits(['update:modelValue','reset']);


const model = computed({
  get: () => props.modelValue,
  set: (value) => emit('update:modelValue', value),
});

</script>

<template>
  <div class="input-group">
    <label :for="id" class="font-bold block mb-3 mt-3">{{ label }}</label>
    <input type="color" class="color-picker"
           :id="id"
           v-model="model"
           @input="emit('update:modelValue', $event.target.value)"
    />
    <button @click="emit('reset')" title="Restore default"><i class="fas fa-rotate"></i></button>
  </div>
</template>

<style scoped lang="sass">
.input-group
  display: flex
  align-items: center
  gap: 1em
  .color-picker
    $size: 2.5em
    $border-radius: 4px
    -webkit-appearance: none
    -moz-appearance: none
    appearance: none
    width: $size
    height: $size
    background-color: transparent
    border: none
    cursor: pointer

    &::-webkit-color-swatch
      border-radius: $border-radius
      border: none

    &::-moz-color-swatch
      border-radius: $border-radius
      border: none

</style>