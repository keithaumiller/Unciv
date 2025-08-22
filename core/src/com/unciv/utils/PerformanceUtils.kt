package com.unciv.utils

/**
 * Simple performance measurement utilities for development
 */
object PerformanceUtils {
    
    private val measurements = mutableMapOf<String, MutableList<Long>>()
    
    /**
     * Measure the execution time of a block of code
     * @param name Name of the measurement for identification
     * @param block The code block to measure
     * @return The result of the block execution
     */
    inline fun <T> measure(name: String, block: () -> T): T {
        val startTime = System.nanoTime()
        val result = block()
        val endTime = System.nanoTime()
        
        val duration = endTime - startTime
        measurements.getOrPut(name) { mutableListOf() }.add(duration)
        
        // Log if in debug mode
        if (DebugUtils.SUPERCHARGED) {
            debug("$name took ${duration / 1_000_000}ms")
        }
        
        return result
    }
    
    /**
     * Get average execution time for a named measurement
     * @param name Name of the measurement
     * @return Average time in milliseconds, or null if no measurements exist
     */
    fun getAverageTime(name: String): Double? {
        val times = measurements[name] ?: return null
        return times.average() / 1_000_000.0 // Convert to milliseconds
    }
    
    /**
     * Get all performance statistics
     * @return Map of measurement names to their average times in milliseconds
     */
    fun getAllStats(): Map<String, Double> {
        return measurements.mapValues { (_, times) ->
            times.average() / 1_000_000.0
        }
    }
    
    /**
     * Clear all measurements
     */
    fun clearMeasurements() {
        measurements.clear()
    }
    
    /**
     * Print all performance statistics to debug log
     */
    fun printStats() {
        if (measurements.isEmpty()) {
            debug("No performance measurements recorded")
            return
        }
        
        debug("=== Performance Statistics ===")
        getAllStats().entries
            .sortedByDescending { it.value }
            .forEach { (name, avgTime) ->
                val count = measurements[name]?.size ?: 0
                debug("$name: ${String.format("%.2f", avgTime)}ms avg ($count samples)")
            }
        debug("============================")
    }
}