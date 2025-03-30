<script setup>

import {computed, ref} from "vue";
import { useConfirm } from "primevue/useconfirm";

const confirm = useConfirm();

const model = defineModel({
  required: false
})

const props = defineProps({
  skipSummary: {
    type: Boolean,
    default: false
  }
});


let emit = defineEmits(['delete']);

const summaryTitle = computed(() => {
  if(!model.value || props.skipSummary){
    return ""
  }
  const modelValue = model.value
  let title = ""
      if(modelValue.conference) {
        title += modelValue.conference
        if (modelValue.name) {
          title += " - " + modelValue.name
        }
      } else if (modelValue.institution) {
        title += modelValue.institution + " - " + modelValue.studyType
      } else if (modelValue.title) {
        title += modelValue.title
      } else {
        title += modelValue.conference ?? modelValue.language ?? modelValue.name ?? modelValue.network ?? ''
      }
      if(modelValue.publisher) {
        title += " - " + modelValue.publisher
      } else if(modelValue.awarder) {
        title += " - " + modelValue.awarder
      }
  return title
})

const summaryTime = computed(() => {
  if(!model.value || props.skipSummary){
    return ""
  }
  return model.value.startDate ? model.value.startDate + " - " + model.value.endDate : model.value.time ?? model.value.date ?? model.value.releaseDate ?? ""
})

// When there's no title it's either cause we are skipping the summary (so it doesn't matter as it will already be expaned)
// or we are creating a new element that still doesn't have any value, so expanding makes sense
const expanded = ref(!summaryTitle.value || summaryTitle.value === "")

function deleteItem() {
  confirm.require({
    message: 'Are you sure you want to delete this item?',
    header: 'Confirm Deletion',
    icon: 'fas fa-exclamation-triangle',
    acceptLabel: 'Yes',
    rejectLabel: 'No',
    acceptClass: 'p-button-danger',
    rejectClass: 'p-button-secondary',
    accept: () => emit('delete'),
  });
}

</script>

<template>
  <div class="input-item" :class="(model?.hidden ? 'hidden-input' : '') + (expanded ? ' expanded' : '')" >
    <div class="content" >
      <div class="input" v-if="expanded || skipSummary">
        <slot/>
      </div>
      <div class="summary" v-else>
        <div class="title">
          {{ summaryTitle }}
        </div>
        <div class="time">
          {{ summaryTime }}
        </div>
      </div>
    </div>

    <div class="actions">
      <i :class="expanded ? 'fas fa-check' : 'fas fa-pencil'" v-if="!skipSummary" @click="() => expanded=!expanded"/>
      <i :class="model?.hidden ? 'fas fa-eye-slash' : 'fas fa-eye'" @click="() => model.hidden = !model?.hidden" v-if="model"></i>
      <i class="fas fa-trash" @click="deleteItem"></i>
      <i class="fas fa-bars handle"></i>
    </div>
  </div>
</template>

<style scoped lang="sass">
.input-item
  width: 100%
  border: 1px solid #333
  margin: 1em auto
  border-radius: 10px
  display: flex
  align-items: center

  &:hover
    .actions
      opacity: 1

  &.hidden-input
    opacity: 30%
    user-select: none

  .content
    flex-grow: 1
    padding: 1em 2em

  .actions
    display: flex
    gap: 1em
    align-items: center
    margin: 0 1em
    opacity: 0.1

    i
      cursor: pointer
      font-size: 1em
      transition: color 0.2s

      &:hover
        color: var(--p-primary-color)
  .summary
    display: flex
    flex-wrap: wrap
    justify-content: space-between

@media (max-width: 768px)
  .input-item.expanded
    flex-wrap: wrap
    .content
      padding: 1em 0.5em
      min-width: 100%
    .actions
      margin: 1em
</style>