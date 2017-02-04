#!/usr/bin/env python

import matplotlib.pyplot as plt


def main():
    fboth = "times-1d-both-R100-cut25000.dat"
    fone  = "times-1d-one-R100-cut25000.dat"

    with open(fboth, 'r') as f:
        times_1d_both = [int(t) for t in f.readlines()]

    with open(fone, 'r') as f:
        times_1d_one = [int(t) for t in f.readlines()]

    plt.hist(times_1d_both, bins = 250, alpha = 0.5, label = 'both')
    plt.hist(times_1d_one, bins = 250, alpha = 0.5, label = 'one')
    plt.ylim(0, 20000)
    plt.legend()
    plt.xlabel("Timesteps to meet")
    plt.ylabel("Counts (out of 1e6)")
    plt.title("Distribution of time to meet (R0 = 100)")
    plt.show()


if __name__ == '__main__':
    main()
