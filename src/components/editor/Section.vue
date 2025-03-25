<script setup>

import {Fieldset} from "primevue";
import {computed, ref} from "vue";
import {useStyleStore} from "@/stores/styleStore";

let styleStore = useStyleStore();

const props = defineProps({
  legend: String,
  hideable: {
    type: Boolean,
    default: true
  },
  icon: String
})

const hidden = computed(() => styleStore.style.hiddenSections.includes(props.legend))
function toggleVisibility(){
  if(hidden.value){
    styleStore.style.hiddenSections = styleStore.style.hiddenSections.filter(e => e !== props.legend)
  } else {
    styleStore.style.hiddenSections.push(props.legend)
  }
}

</script>

<template>
  <div class="section" :class="hidden ? 'hidden-section' : ''">
    <Fieldset>
      <template #legend>
        <div class="legend">
          <div class="section-title">
            <i class="icon" :class="icon"></i>
            <span class="title">{{ legend }}</span>
          </div>
          <div class="actions">
            <i class="icon" :class="hidden ? 'fas fa-eye-slash' : 'fas fa-eye'" v-if="hideable" @click="toggleVisibility"></i>
          </div>
        </div>
      </template>
      <slot/>
    </Fieldset>
  </div>
</template>

<style scoped lang="sass">
.section
  width: 100%
  position: relative
  margin-top: 1em
  &.hidden-section
    opacity: 30%
  .legend
    display: flex
    justify-content: space-between
    align-items: center
    gap: 1em

    .section-title
      display: flex
      align-items: center
      gap: 0.5em
      font-size: 1.3em
      padding: 1em 0

      .icon
        color: var(--p-primary-color)

      .title
        font-weight: bold

    .actions
      display: flex
      gap: 0.5em

      .icon
        position: absolute
        right: 0.5em
        top: 0.4em
        opacity: 0.3
        font-size: 1.5em

        &:hover
          opacity: 1
          cursor: pointer
          color: var(--p-primary-color)


</style>