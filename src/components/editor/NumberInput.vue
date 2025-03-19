<script setup>
import {computed, useId} from 'vue'; // VueUse for unique ID generation
import InputNumber from 'primevue/inputnumber';
import FloatLabel from 'primevue/floatlabel';

const props = defineProps({
  modelValue: Number,
  label: String,
  maxFractionDigits: {
    type: Number,
    default: 2
  }
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
    <InputNumber
        :id="inputId"
        v-model="model"
        @input:modelValue="emit('update:modelValue', $event.target?.value??modelValue)"
        show-buttons
        v-bind="$attrs"
        :maxFractionDigits="maxFractionDigits"
    />
    <label :for="inputId">{{ props.label }}</label>
  </FloatLabel>
</template>