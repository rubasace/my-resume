<script setup>
import {computed, useId} from 'vue'; // VueUse for unique ID generation
import InputText from 'primevue/inputtext';
import FloatLabel from 'primevue/floatlabel';

const props = defineProps({
  modelValue: String,
  label: String
});

const emit = defineEmits(['update:modelValue']);
const uniqueId = useId();
const inputId = `${props.label.toLowerCase()}-${uniqueId}`;

const model = computed({
  get: () => props.modelValue,
  set: (value) => emit('update:modelValue', value),
});

</script>

<template>
  <FloatLabel variant="on">
    <label :for="inputId" class="font-bold block mb-2">{{ props.label }}</label>
    <InputText
        :id="inputId"
        v-model="model"
        @input="emit('update:modelValue', $event.target.value)"
        fluid
    />
  </FloatLabel>
</template>