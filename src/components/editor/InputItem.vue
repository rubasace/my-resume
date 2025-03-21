<script setup>
import {defineEmits} from 'vue'

const emit = defineEmits(['moveUp', 'moveDown', 'delete', 'hide'])
</script>

<template>
  <div class="input-item">
    <div class="actions">
      <i class="fas fa-bars handle"></i>
    </div>

    <div class="content">
      <slot/>
    </div>

    <div class="actions">
      <i class="fa fa-trash" @click="emit('delete')"></i>
      <!-- TODO handle show/hide state -->
<!--      <i class="fa fa-eye" @click="emit('hide')"></i>-->
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

  .content
    flex-grow: 1
    padding: 1em 2em

  .actions
    display: flex
    gap: 0.6em
    align-items: center
    margin: 0 1em

    i
      cursor: pointer
      font-size: 1em
      transition: color 0.2s

      &:hover
        color: var(--p-secondary-color)
</style>