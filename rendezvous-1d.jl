#!/usr/bin/env julia

using StatsBase

function steps_to_meet_1d_both(R0 = 5, N = 1000, cutoff = 2000)
    times = Array(Int64, N)
    for i in 1:N
        R = R0
        T = 0
        while R > 0 && T < cutoff
            R += rand([-2, 0, 0, 2])
            T += 1
        end
        times[i] = T
    end
    return times
end

function steps_to_meet_1d_one(R0 = 5, N = 1000, cutoff = 2000)
    times = Array(Int64, N)
    for i in 1:N
        R = R0
        T = 0
        while R > 0 && T < cutoff
            R += rand([-1, 1])
            T += 1
        end
        times[i] = T
    end
    return times
end

function main()
    R0 = 100
    N = 1000000
    cutoff = 25000
    for t in steps_to_meet_1d_both(R0, N, cutoff)
        println(t)
    end

    # hist = countmap(steps_to_meet_1d_both(R0, N, cutoff))
    # for time in sort(keys(hist))
    #     println(time, " ", hist[time])
    # end
end

main()
