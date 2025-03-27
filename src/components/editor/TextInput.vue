<script setup>
import {computed, ref, useId} from 'vue'; // VueUse for unique ID generation
import InputText from 'primevue/inputtext';
import FloatLabel from 'primevue/floatlabel';
import AutoComplete from 'primevue/autocomplete';

const props = defineProps({
  modelValue: [String, Number],
  label: String,
  options: Array
});

const emit = defineEmits(['update:modelValue']);
const uniqueId = useId();
const inputId = `${props.label.toLowerCase()}-${uniqueId}`;

const model = computed({
  get: () => props.modelValue,
  set: (value) => emit('update:modelValue', value),
});


const filteredOptions = ref([])

function search(event) {
  const query = event.query?.trim() ?? ''
  const lowerQuery = query.toLowerCase()

  const matching = props.options.map(opt => ({
    label: opt,
    value: opt
  })).filter(opt =>
      opt.value.toLowerCase().includes(lowerQuery)
  )

  const exists = props.options.some(
      opt => opt.toLowerCase() === lowerQuery
  )

  if (query && !exists) {
    filteredOptions.value = [
      ...matching,
      { label: `+ Add "${query}"`, value: query }
    ]
  } else {
    filteredOptions.value = matching
  }
}

function handleSelection(val) {
  emit('update:modelValue', val.value)
}

</script>

<template>
  <FloatLabel variant="on">
    <label :for="inputId" class="font-bold block mb-2">{{ props.label }}</label>
    <AutoComplete
        v-if="options?.length"
        :modelValue="modelValue"
        :suggestions="filteredOptions"
        optionLabel="label"
        optionValue="value"
        dropdown
        complete-on-focus
        @complete="search"
        @update:modelValue="handleSelection"
    />

    <InputText
        v-else
        :id="inputId"
        v-model="model"
        @input="emit('update:modelValue', $event.target.value)"
        fluid
    />
  </FloatLabel>
</template>