import {ref, onUnmounted, watch} from 'vue'

export function useDraggable(htmlElement) {
    const initialOffsetX = ref(0)
    const initialOffsetY = ref(0)
    const offsetX = ref(0)
    const offsetY = ref(0)
    const currentDragX = ref(0)
    const currentDragY = ref(0)
    const startX = ref(0)
    const startY = ref(0)
    const dragging = ref(false)

    function reset() {
        initialOffsetX.value = 0
        initialOffsetY.value = 0
        offsetX.value = 0
        offsetY.value = 0
        currentDragX.value = 0
        currentDragY.value = 0
        startX.value = 0
        startY.value = 0
        dragging.value = false
    }

    function onMouseDown(e) {
        dragging.value = true
        startX.value = e.clientX
        startY.value = e.clientY
        window.addEventListener('mousemove', onMouseMove)
        window.addEventListener('mouseup', onMouseUp)
    }

    function onMouseMove(e) {
        if (!dragging.value) return
        currentDragX.value = e.clientX - startX.value
        currentDragY.value = e.clientY - startY.value
        offsetX.value = initialOffsetX.value + currentDragX.value
        offsetY.value = initialOffsetY.value + currentDragY.value
    }

    function onMouseUp() {
        if (!dragging.value) return
        dragging.value = false
        currentDragX.value = 0
        currentDragY.value = 0
        initialOffsetX.value = offsetX.value
        initialOffsetY.value = offsetY.value

        window.removeEventListener('mousemove', onMouseMove)
        window.removeEventListener('mouseup', onMouseUp)
    }

    watch(htmlElement, (e) =>
        e?.addEventListener('mousedown', onMouseDown)
    )

    onUnmounted(() => {
        htmlElement.value?.removeEventListener('mousedown', onMouseDown)
    })

    return {
        x: offsetX,
        y: offsetY,
        resetDragging: reset
    }
}